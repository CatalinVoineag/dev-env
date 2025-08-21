local Worktree = require('git-worktree')
local Job = require('plenary.job')

-- op = Operations.Switch, Operations.Create, Operations.Delete
-- metadata = table of useful values (structure dependent on op)
--      Switch
--          path = path you switched to
--          prev_path = previous worktree path
--      Create
--          path = path where worktree created
--          branch = branch name
--          upstream = upstream remote name
--      Delete
--          path = path where worktree deleted

Worktree.on_tree_change(function(op, metadata)
  --print('op', Worktree.Operations.Create)

  if op == Worktree.Operations.Switch then
  --if op == Worktree.Operations.Create then
    print('bundle install')
    Job:new({
      command = 'bundle',
      args = { 'install' }
    }):start()

    print('bin/prepare')
    Job:new({
      command = 'bin/prepare'
    }):start()

    print('copying database.yml')
    Job:new({
      command = 'cp',
      args = { '../../main/config/database.yml', 'config/database.yml' }
    }):start()

  end
end)
