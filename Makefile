PROTOC_GEN_DART_BIN := /Users/masutanoakira/.pub-cache/bin/protoc-gen-dart

.PHONY: proto
proto:
	@if [ -z "$(PROTOC_GEN_DART_BIN)" ]; then \
	  echo "protoc-gen-dart not found. Run 'make install-protoc-plugin' first."; \
	  exit 1; \
	fi
	# Add include path for standard Google protobuf types, specify plugin path, and explicitly include imported protos
	protoc --plugin=protoc-gen-dart=/Users/masutanoakira/.pub-cache/bin/protoc-gen-dart \
	       --dart_out=grpc:lib/generated \
	       -Iprotos \
	       -I/opt/homebrew/include \
	       protos/crm.proto # Only specify the main proto file as input

.PHONY: install-protoc-plugin
install-protoc-plugin:
	dart pub global activate protoc_plugin
	@echo 'Make sure ~/.pub-cache/bin is in your PATH!' 
.PHONY: build
build:
	flutter pub get
	flutter build macos --release
