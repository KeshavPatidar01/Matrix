class Chunk < ApplicationRecord
  belongs_to :chunkable, polymorphic: true

   has_neighbors :embeddings, dimensions: 768
end
