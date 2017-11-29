class PostgresConnection

  def initialize
    @connection = ActiveRecord::Base.connection
  end

  def raw_sql(query)
    @connection.execute(query)
  end
end
