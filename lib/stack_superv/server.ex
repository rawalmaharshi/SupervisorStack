defmodule StackSuperv.Server do
    use GenServer
    alias StackSuperv.Impl

    def init(_) do
        {:ok, StackSuperv.Stash.get()} #state is stack elements
    end
    
    def handle_call(:pop, _from, list) do
        {:reply, List.first(list), Impl.pop(list)}
    end
    
    def handle_cast({:push, element}, current_state_list) do
        {:noreply, Impl.push(current_state_list, element)}
    end

    def terminate(reason, current_stack_state) do 
        IO.inspect reason
        # IO.inspect state
        StackSuperv.Stash.update(current_stack_state)
        IO.puts "exiting genserver @@@@@ $$$ ### ****"
    end


    #Client
    @server StackSuperv.Server

  def start_link(_) do
    GenServer.start_link(@server, nil, [name: @server, debug: [:trace]])
  end

  def pop do
    GenServer.call(@server, :pop)
  end

  def push(element) do
    GenServer.cast(@server, {:push, element})
  end

  def stop(reason) do
    GenServer.stop(@server, {:terminate, reason})
  end
end