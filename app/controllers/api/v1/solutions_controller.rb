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
      a: params[:a].to_i,
      b: params[:b].to_i,
      c: params[:c].to_i,
      d: params[:d].to_i,
      type: params[:type]
    }
  end
end
