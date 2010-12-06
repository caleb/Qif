require File.expand_path('../../spec_helper', __FILE__)

describe Qif::Transaction do
  describe '::read' do
    it 'should return a new transaction' do
      date = Time.now
      t = Qif::Transaction.read(
        'D' => date,
        'T' => '10.0',
        'L' => 'Credit',
        'M' => 'Supermarket',
        'P' => 'abcde',
        'N' => '1001'
      )
      t.should be_a(Qif::Transaction)
      t.date.should == date
      sprintf('%.2f', t.amount).should == '10.00'
      t.name.should == 'Credit'
      t.description.should == 'Supermarket'
      t.reference.should == 'abcde'
      t.check_number.should == '1001'
    end

    it 'should return nil if the date does not respond to strftime' do
      Qif::Transaction.read('D' => 'hello').should be_nil
    end
  end

  describe '#to_s' do
    before do
      @instance = Qif::Transaction.new(
        :date => Time.mktime(2010, 1, 2),
        :amount => -10.0,
        :name => 'Debit',
        :description => 'Supermarket',
        :reference => 'abcde',
        :check_number => '1001'
      )
    end

    it 'should format the date in the format specified as D' do
      @instance.to_s('dd/mm/yyyy').should include('D02/01/2010')
      @instance.to_s('mm/dd/yyyy').should include('D01/02/2010')
    end

    it 'should put the amount in T' do
      @instance.to_s.should include('T-10.00')
    end

    it 'should put the name in L' do
      @instance.to_s.should include('LDebit')
    end

    it 'should put the description in M' do
      @instance.to_s.should include('MSupermarket')
    end

    it 'should put the reference in P' do
      @instance.to_s.should include('Pabcde')
    end

    it 'should put the check number in N' do
      @instance.to_s.should include('1001')
    end
  end
end

