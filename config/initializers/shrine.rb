require "shrine"
require "shrine/storage/file_system"

Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads")
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data

file_system = Shrine.storages[:cache]
file_system.clear!(older_than: Time.now - 1*24*60*60)