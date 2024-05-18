require 'pg'
require 'pry'

# module SessionPersistance
#   def initialize(session)
#     @session = session
#     @session[:dogs] ||= []
#   end
# end

module DatabasePersistance
  def initialize(logger)
    @db = if Sinatra::Base.production?
        PG.connect(ENV['DATABASE_URL'])
      else
        PG.connect(dbname: "dogs")
      end
    @logger = logger
  end
  
  def disconnect
    @db.close
  end
  
  def query(statement, *params)
    @logger.info "#{statement}: #{params}"
    @db.exec_params(statement, params)
  end
end

class DogHandler
  # include SessionPersistance
  include DatabasePersistance
  
  def add_dog(name)
    # @session[:dogs] << { name: name, attributes: [] }
  end
  
  def retrieve_dogs
    # @session[:dogs]
    sql = <<~SQL
      SELECT * FROM dogs;
    SQL
    result = query(sql)
    query_result_to_dogs(result)
  end
  
  private
  
  def query_result_to_dogs(result)
    result.map do |tuple|
      {
        name: tuple["name"],
        attributes: ["test", "size", "working"]
      }
    end
  end
end