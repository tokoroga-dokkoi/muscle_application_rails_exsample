require 'test_helper'

class TodosControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:testuser)
    @todo = todos(:testtodo)
  end

  test "valid todo data should create" do
    login_as(@user, scope: :user)
    post todos_url,xhr:true,  params:{
      todo:{
        title: @todo.title,
        weight: @todo.weight,
        set_count: @todo.set_count,
        clear_plan: @todo.clear_plan
      }
    }
    assert_response :success
    assert_difference "Todo.count", 1 do
      post todos_url,xhr:true,  params:{
        todo:{
          title: @todo.title,
          weight: @todo.weight,
          set_count: @todo.set_count,
          clear_plan: @todo.clear_plan
        }
      }
    end


  end

end
