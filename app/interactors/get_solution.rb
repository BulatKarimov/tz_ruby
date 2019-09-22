class GetSolution
  include Interactor

  def call
    if context.type == 'sqrt'
      context.result = solve_sqr
    else
      context.result = solve_lin
    end
  end

  private

  def solve_lin
    x = (context.c - context.b) / context.a.to_f
    
  end

  def solve_sqr
    if discriminant == 0
      x = -context.b/(2 * context.a).to_f
    elsif discriminant > 0
      [
        (-context.b - Math.sqrt(discriminant))/(2*context.a).to_f,
        (-context.b + Math.sqrt(discriminant))/(2*context.a).to_f
      ]
    else
      #комплесные числа не рассматривал в данном случае
      'No solution, because D < 0'
    end
  end 
  
  def discriminant
    context.b**2 - 4 * context.a * context.c
  end
end