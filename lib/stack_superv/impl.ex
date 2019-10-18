defmodule StackSuperv.Impl do
    
    def pop(stack_list) do
        [_head | tail] = stack_list
        stack_list = tail
    end

    def push(stack_list, element) do
        [element] ++ stack_list
    end
end