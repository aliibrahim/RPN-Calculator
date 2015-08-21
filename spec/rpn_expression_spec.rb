require 'spec_helper'

describe RPNExpression do

  describe ".initialize" do

    subject { RPNExpression.new("\n11 + 3 * 2 - 3 * =") }

    it "removes whitespaces from the expression" do
      expect(subject.expression).not_to include(' ')
    end

    it "removes newlines characters from the expression" do
      expect(subject.expression).not_to include('\n')
    end

    it "removes delimiter character from the expression" do
      expect(subject.expression).not_to include('=')
    end

    it "return expression with valid syntax" do
      expect(subject.expression).to eq('11+3*2-3*')
    end
  end

  describe ".calculate" do
    
    context "When expression is invalid" do
      it "prints Not a valid expression message!" do
        expect(STDOUT).to receive(:puts).with("Not a valid expression!")
        RPNExpression.new("\n11 + 3 * 2 - + * =").calculate
      end

      it "prints Not a valid expression message!" do
        expect(STDOUT).to receive(:puts).with("Not a valid expression!")
        RPNExpression.new("\n11 + 3 * 2 - WAT * =").calculate
      end

    end

    context "When expression is valid" do
      subject { RPNExpression.new("\n11 + 3 * 2 - 3 * =").calculate }

      it "returns and calculates correct value for expression" do
        expect(subject).to eq(12.0)
      end

      it "returns and calculates correct value for expression rounded to 3 digits" do
        expression = RPNExpression.new("\n11 + 3 * 2 - 3 * 7 /=").calculate
        expect(expression).to eq(1.714)
      end
    end

  end

end