class TaskController < ApplicationController
  def all
    @tasks = ["a", "b", "c"]
  end
end
