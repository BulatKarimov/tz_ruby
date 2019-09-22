class Api::V1::SolutionsController < Api::V1::ApplicationController

  def solve
    result = SolveExample.call(set_solve_params)

    if result.success?
      render json: { result: result.result }, status: :ok
    else
      render json: { message: result.error }, status: :unprocessable_entity
    end
  end

  private 

  def set_solve_params
    {
      a: params[:a],
      b: params[:b],
      c: params[:c],
      d: params[:d],
      type: params[:type]
    }
  end
end
