require_relative 'service'

RSpec.describe Service do
  subject(:service) { described_class.new(str:, vocabulary:) }

  describe '#call' do
    subject { service.call }

    let(:vocabulary) { %w[две сотни тысячи] }

    context 'with success result' do
      let(:str) { 'двесотни' }

      it { is_expected.to eq(true) }
    end

    context 'with failure result' do
      let(:str) { 'invalid' }

      it { is_expected.to eq(false) }
    end
  end
end
