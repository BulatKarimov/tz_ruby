class CheckParams
  include Interactor

  before do
    context.fail!(error: 'Type is missing') unless context.type.present?
  end

  def call
    context.fail!(error: 'A param is missing or must be integer') if context.a.nil?
    context.fail!(error: 'B param is missing or must be integer') if context.b.nil?
    context.fail!(error: 'C param is missing or must be integer') if context.c.nil?

    if context.type == 'sqrt'
      context.fail!(error: 'D param is missing or must be integer') if context.d.nil?
    elsif context.type != 'lin' && context.type != 'sqrt'
      context.fail!(error: "Type must be 'sqrt' of 'lin'")
    end
  end
end