require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
    var = self.table_name
    data = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        "#{var}"
    SQL
    @columns = data[0].map(&:to_sym)
    # instance_variables.each do |var|
    #     result << var.to_sym
    # end
    # result
  end

  def self.finalize!
    # self.attributes
    self.columns.each do |name|

      new_var = "#{name}".to_sym  # star >> :@star
      define_method(name) do
        self.attributes[name]
        # self.attributes["#{name}"] = instance_variable_get(new_var)
      end

      assign_var = "#{name}="  # star=
      define_method(assign_var) do |value|
        self.attributes[name] = value  #star = value
      end

    end
    # attributes
  end

  def self.table_name=(table_name)
    @table_name = table_name
    # ...
  end

  def self.table_name
    class_name = self.to_s
    # prc = Proc.new do |letter|
    #   letter == string.upcase
    # end

    # or use .inflector  from active_support

    names = class_name.split /(?=[A-Z])/
    names.map!(&:downcase)
    answer = names.join("_") + "s"

    @table_name ||= answer
    @table_name
    # ...
  end

  def self.all
    # debugger
    data_hash = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
    SQL
    parse_all(data_hash)
    # ...
  end

  def self.parse_all(results)
    # self.class
    contents = []
    results.each do |entry|
      # entry.each do |column, value|
      contents << new(entry)
      # end
    end
    contents

    # ...
  end

  def self.find(id)

    data_hash_array = DBConnection.execute(<<-SQL)
      SELECT
        *
      FROM
        "#{self.table_name}"
      WHERE
        id = #{id}
    SQL

      #To Do ask why "id = #{id}" doesnt work

    if data_hash_array.first.nil?
      return nil
    else
      new(data_hash_array.first)
    end
    # ...
  end

  def initialize(params = {})
    # @table_name = nil
    # @columns = nil
    # ...

    params.each do |attr_name, value|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name.to_sym)
      method_name = "#{attr_name}=".to_sym
      self.send(method_name, value)
    end

    # self.class
    # params.each
    # finalize!
  end

  def attributes
    @attributes ||= {}
    # ...
  end

  def attribute_values
    result = []
    self.class.columns.map do |column|
      result << self.send("#{column}".to_sym)
    end
    result
    # ...
  end

  def insert
    how_many = self.class.columns.length
    question_marks = (["?"] * (how_many - 1)).join(", ")
    col_names = self.class.columns[1..-1].join(", ")
    # debugger

#Questions:

    data_hash_array = DBConnection.execute(<<-SQL, attribute_values[1..-1])

      INSERT INTO
        #{self.class.table_name} (#{col_names})
      VALUES
        (#{question_marks})
      SQL

    # self.send(:id=, DBConnection.last_insert_row_id)  #also works
    # self.send(:id=, self.class.all[-1].id)            # also works

    self.id = DBConnection.last_insert_row_id

  end

  def update
#     UPDATE
#       table_name
#     SET
#       col1 = ?, col2 = ?, col3 = ?
#     WHERE
#       id = ?

    these_columns = self.class.columns[1..-1]

    names = these_columns.map { |attr_name| "#{attr_name} = ?" }.join(", ")
    # id = self.class.columns.first


    DBConnection.execute(<<-SQL, *attribute_values[1..-1], id)

      UPDATE
        #{self.class.table_name}
      SET
        #{names}
      WHERE
        #{self.class.table_name}.id = ?
      SQL
  end

  def save
    if id.nil?
      insert
    else
      update
    end
    # ...
  end
end
