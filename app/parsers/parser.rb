require 'csv'

class Parser
  attr_accessor :table

  def initialize(file, options={})
    options.reverse_merge!(headers: true, col_sep: "\t")
    @table = CSV.parse(IO.read(file), options)
  end

  def import_orders!
    self.table.collect do |row|
      RowParser.new(row).parse!
    end
  end
end