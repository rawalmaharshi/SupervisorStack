defmodule StackSuperv.Stash do
    use GenServer, restart: :permanent

    @me __MODULE__

    def start_link(init_stack_element_list) do
        GenServer.start_link(@me, init_stack_element_list, [name: @me, debug: [:trace]])
    end

    def get() do
        GenServer.call(@me, {:get})
    end

    def update(updated_stack_element_list) do
        GenServer.cast(@me, {:update, updated_stack_element_list})
    end

    #Server Implementation
    def init(init_stack_element_list) do
        {:ok, init_stack_element_list}
    end

    def handle_call({:get}, _from, current_stack_state) do
        {:reply, current_stack_state, current_stack_state}
    end

    def handle_cast({:update, updated_stack_element_list}, _current_state) do
        {:noreply, updated_stack_element_list}
    end
end