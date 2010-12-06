require 'qif/date_format'

module Qif
  # The Qif::Transaction class represents transactions in a qif file.
  class Transaction
    attr_accessor :date, :amount, :name, :description, :reference, :check_number
    
    def self.read(record) #::nodoc
      return nil unless record['D'].respond_to?(:strftime)
      
      Transaction.new(
        :date => record['D'],
        :amount => record['T'], 
        :name => record['L'], 
        :description => record['M'],
        :reference => record['P'],
        :check_number => record['N']
      )
    end
    
    def initialize(attributes = {})
      @date = attributes[:date]
      @amount = attributes[:amount]
      @name = attributes[:name]
      @description = attributes[:description]
      @reference = attributes[:reference]
      @check_number = attributes[:check_number]
    end
    
    # Returns a representation of the transaction as it
    # would appear in a qif file.
    def to_s(format = 'dd/mm/yyyy')
      {
        'D' => DateFormat.new(format).format(date),
        'T' => amount,
        'L' => name,
        'M' => description,
        'P' => reference,
        'N' => check_number
      }.map{|k,v| "#{k}#{v}" }.join("\n")
    end
  end
end
