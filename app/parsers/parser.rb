require 'csv'

class Parser
  attr_accessor :table

  def initialize(csv_string, options={})
    options.reverse_merge!(headers: true, col_sep: "\t")
    @table = CSV.parse(csv_string, options) if csv_string.present?
  end

  def import_orders!
    return false if @table.blank?

    self.table.collect do |row|
      RowParser.new(row).parse!
    end
  end
end