# frozen_string_literal: true

class FileFingerprintsController < ApplicationController
  def index
    render json: JSONAPI::ResourceSerializer.new(FileFingerprintResource).serialize_to_hash(resources).to_json
  end

  private

  def resources
    models = ApplicationRecord.descendants.collect(&:name).map do |model_name|
      puts "model_name: #{model_name}"
      next if model_name.constantize.abstract_class?

      FileFingerprint.new(model_name, model_name.constantize.new.attributes.keys)
    end
    models.compact!
    models.map { |record| FileFingerprintResource.new(record, nil) }
  end
end
