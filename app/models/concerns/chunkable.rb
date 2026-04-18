module Chunkable 
    extend ActiveSupport::Concern 

    class_methods do 
 def search(q)

  query_response = gemini_ai.embed(text: q)

  vector_data = query_response.embedding 
 
  Chunk.nearest_neighbors(:embeddings, vector_data, distance: "cosine")
       .first(2)
       .map(&:chunkable)
       .uniq
rescue => e
  puts " error? : #{e.message}"
  []
end

       
def gemini_ai
gemini_llm = Langchain::LLM::GoogleGemini.new(api_key: "AIzaSyDDyrUHqTIDNPQB3Qu692hwFBT-EZJyMVg")

        

    end 
    end 

    def chunk!

        chunks.destroy_all

        Langchain::Chunker::RecursiveText.new(


            chunkable_s, 
            chunk_size: 3072, 
            
            chunk_overlap: 200,
            separators: ["\n\n"]).chunks.each do |chunk|
            
                
                
                
                content = chunk.text

                  response = gemini_ai.embed(text: content)
                  vector_data = response.embedding
                  chunks.create!(
                
                    content: content, 
                    embeddings: vector_data  
                  )
        end
        puts "#{chunks.count},  #{id}"
        
    end 
    def gemini_ai
gemini_llm = Langchain::LLM::GoogleGemini.new(api_key: "AIzaSyDDyrUHqTIDNPQB3Qu692hwFBT-EZJyMVg")

    

end 












end 