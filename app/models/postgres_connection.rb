class PostgresConnection

  def initialize
    @connection = ActiveRecord::Base.establish_connection.connection
  end

  def raw_sql(query)
    @connection.execute(query)
  end
  
end
