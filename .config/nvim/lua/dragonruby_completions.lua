-- dragonruby_complete_api_completions_v2.lua
-- Comprehensive DragonRuby API completion items for nvim-cmp.
-- This file attempts to include all public API methods and properties documented at:
-- https://docs.dragonruby.org/static/docs.html
-- Each completion item is a separate entry with a flat label.
-- Adjust documentation strings as needed.

return {
  {
    label = "args",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Global table passed to the tick function.
Contains inputs, outputs, gtk, state, grid, etc.]]
    }
  },
  {
    label = "args.inputs",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Input interfaces including keyboard, mouse, and controllers.]]
    }
  },
  {
    label = "args.inputs.keyboard",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Handles keyboard input.]]
    }
  },
  {
    label = "args.inputs.keyboard.key_down",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Detects if a key was pressed during the current tick.
Usage: args.inputs.keyboard.key_down.<key>]]
    }
  },
  {
    label = "args.inputs.keyboard.key_held",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if a key is held down.
Usage: args.inputs.keyboard.key_held.<key>]]
    }
  },
  {
    label = "args.inputs.keyboard.key_up",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Detects if a key was released during the current tick.
Usage: args.inputs.keyboard.key_up.<key>]]
    }
  },
  {
    label = "args.inputs.keyboard.up",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if the up arrow (or "w") is pressed.]]
    }
  },
  {
    label = "args.inputs.keyboard.down",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if the down arrow (or "s") is pressed.]]
    }
  },
  {
    label = "args.inputs.keyboard.left",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if the left arrow (or "a") is pressed.]]
    }
  },
  {
    label = "args.inputs.keyboard.right",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if the right arrow (or "d") is pressed.]]
    }
  },
  {
    label = "args.inputs.keyboard.left_right",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns -1, 0, or +1 based on horizontal input direction.]]
    }
  },
  {
    label = "args.inputs.keyboard.up_down",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns -1, 0, or +1 based on vertical input direction.]]
    }
  },
  {
    label = "args.inputs.keyboard.left_right_directional",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns a normalized directional value for left/right input.]]
    }
  },
  {
    label = "args.inputs.keyboard.up_down_directional",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns a normalized directional value for up/down input.]]
    }
  },
  {
    label = "args.inputs.mouse",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Handles mouse input.
Provides properties: x, y, click, held, etc.]]
    }
  },
  {
    label = "args.inputs.mouse.x",
    kind = vim.lsp.protocol.CompletionItemKind.Variable,
    documentation = {
      kind = "markdown",
      value = [[Current mouse X position.]]
    }
  },
  {
    label = "args.inputs.mouse.y",
    kind = vim.lsp.protocol.CompletionItemKind.Variable,
    documentation = {
      kind = "markdown",
      value = [[Current mouse Y position.]]
    }
  },
  {
    label = "args.inputs.mouse.click",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if a mouse click occurred this tick.]]
    }
  },
  {
    label = "args.inputs.mouse.held",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if the mouse button is held.]]
    }
  },
  {
    label = "args.inputs.mouse.wheel",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the delta change in mouse wheel movement.]]
    }
  },
  {
    label = "args.inputs.mouse.relative",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the relative mouse movement since the last tick.]]
    }
  },
  {
    label = "args.inputs.controller_one",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Handles the first controller's input.]]
    }
  },
  {
    label = "args.inputs.controller_one.a",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if the A button is pressed on controller one.]]
    }
  },
  {
    label = "args.inputs.controller_one.b",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if the B button is pressed on controller one.]]
    }
  },
  {
    label = "args.inputs.controller_one.x",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if the X button is pressed on controller one.]]
    }
  },
  {
    label = "args.inputs.controller_one.y",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if the Y button is pressed on controller one.]]
    }
  },
  {
    label = "args.inputs.controller_one.left_stick",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the current state of the left analog stick.]]
    }
  },
  {
    label = "args.inputs.controller_one.right_stick",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the current state of the right analog stick.]]
    }
  },
  {
    label = "args.outputs",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Handles rendering output.
Includes labels, sprites, solids, borders, lines, debug, screenshots, and shaders.]]
    }
  },
  {
    label = "args.outputs.labels",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Queues text labels for rendering.
Usage: args.outputs.labels << { x, y, text, ... }]]
    }
  },
  {
    label = "args.outputs.sprites",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Queues sprite images for rendering.
Define x, y, w, h, and path (or source_x, source_y, source_w, source_h).]]
    }
  },
  {
    label = "args.outputs.solids",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Queues solid color rectangles.
Usage: args.outputs.solids << { x, y, w, h, r, g, b, a }]]
    }
  },
  {
    label = "args.outputs.borders",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Queues bordered rectangles (unfilled shapes) for rendering.]]
    }
  },
  {
    label = "args.outputs.lines",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Queues line primitives for rendering.
Usage: args.outputs.lines << { x, y, x2, y2, r, g, b, a }]]
    }
  },
  {
    label = "args.outputs.debug",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Queue for rendering debug primitives and watch values.]]
    }
  },
  {
    label = "args.outputs.screenshots",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Captures a screenshot of the current frame.]]
    }
  },
  {
    label = "args.outputs.shaders",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Handles shader configuration and effects.]]
    }
  },
  {
    label = "args.gtk",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Provides a collection of utility and system functions,
including file I/O, HTTP requests, window management, and more.]]
    }
  },
  {
    label = "args.gtk.get_pixels",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Retrieves the pixel buffer of an image or the screen.
Usage: args.gtk.get_pixels("path/to/image")]]
    }
  },
  {
    label = "args.gtk.calcstringbox",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Calculates the bounding box dimensions (width and height) needed to render a string.]]
    }
  },
  {
    label = "args.gtk.request_quit",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Queues a request to quit the game after the current tick.
Usage: args.gtk.request_quit()]]
    }
  },
  {
    label = "args.gtk.show_cursor",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Makes the mouse cursor visible.
Usage: args.gtk.show_cursor()]]
    }
  },
  {
    label = "args.gtk.hide_cursor",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Hides the mouse cursor.
Usage: args.gtk.hide_cursor()]]
    }
  },
  {
    label = "args.gtk.reset",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Resets the game state and reloads source code on the next tick.
Usage: args.gtk.reset()]]
    }
  },
  {
    label = "args.gtk.start_server!",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Starts an in-game HTTP server for remote hotloading.
Usage: args.gtk.start_server!({ port = 9001, enable_in_prod = true })]]
    }
  },
  {
    label = "args.gtk.read_file",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Reads and returns the contents of a file from the game directory.
Usage: args.gtk.read_file("filename")]]
    }
  },
  {
    label = "args.gtk.write_file",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Writes a given string to a file (overwriting if it exists) in the game directory.
Usage: args.gtk.write_file("filename", "contents")]]
    }
  },
  {
    label = "args.gtk.http_get",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Performs an asynchronous HTTP GET request.
Usage: args.gtk.http_get("url")]]
    }
  },
  {
    label = "args.gtk.http_post",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Performs an asynchronous HTTP POST request.
Usage: args.gtk.http_post("url", form_fields, headers)]]
    }
  },
  {
    label = "args.gtk.version",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the current DragonRuby version string.]]
    }
  },
  {
    label = "args.gtk.set_window_fullscreen",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Sets the game window to fullscreen (true) or windowed (false).
Usage: args.gtk.set_window_fullscreen(true)]]
    }
  },
  {
    label = "args.gtk.set_window_scale",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Sets the window scale factor (e.g., 0.5, 1.0, 1.5).
Usage: args.gtk.set_window_scale(1.0)]]
    }
  },
  {
    label = "args.gtk.notify",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Displays a notification message in-game.
Usage: args.gtk.notify("Message")]]
    }
  },
  {
    label = "args.state",
    kind = vim.lsp.protocol.CompletionItemKind.Variable,
    documentation = {
      kind = "markdown",
      value = [[Table for persisting game state between ticks.
Use to store custom variables.]]
    }
  },
  {
    label = "args.geometry",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Provides helper methods for geometry, collision detection, and positioning.]]
    }
  },
  {
    label = "args.geometry.intersect_rect?",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if two rectangles intersect.
Usage: args.geometry.intersect_rect?(rect1, rect2)]]
    }
  },
  {
    label = "args.geometry.inside_rect?",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns true if one rectangle is completely inside another.
Usage: args.geometry.inside_rect?(inner, outer)]]
    }
  },
  {
    label = "args.geometry.scale_rect",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Scales a rectangle by a specified factor.
Usage: args.geometry.scale_rect(rect, factor)]]
    }
  },
  {
    label = "args.geometry.angle_to",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Calculates the angle in degrees from one point to another.
Usage: args.geometry.angle_to(point1, point2)]]
    }
  },
  {
    label = "args.geometry.angle_from",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Calculates the reverse angle from one point to another.
Usage: args.geometry.angle_from(point1, point2)]]
    }
  },
  {
    label = "args.geometry.point_inside_circle?",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Determines if a point lies inside a circle defined by a center and radius.
Usage: args.geometry.point_inside_circle?(point, center, radius)]]
    }
  },
  {
    label = "args.geometry.center_inside_rect",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the center (x, y) of a rectangle.
Usage: args.geometry.center_inside_rect(rect)]]
    }
  },
  {
    label = "args.geometry.center_inside_rect_x",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the center x-coordinate of a rectangle.]]
    }
  },
  {
    label = "args.geometry.center_inside_rect_y",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the center y-coordinate of a rectangle.]]
    }
  },
  {
    label = "args.geometry.anchor_rect",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Anchors a rectangle using specified anchor_x and anchor_y values.
Usage: args.geometry.anchor_rect(rect, anchor_x, anchor_y)]]
    }
  },
  {
    label = "args.geometry.rect_center_point",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the center point of a rectangle.
Usage: args.geometry.rect_center_point(rect)]]
    }
  },
  {
    label = "args.grid",
    kind = vim.lsp.protocol.CompletionItemKind.Module,
    documentation = {
      kind = "markdown",
      value = [[Provides access to the virtual grid and safe areas for layout.]]
    }
  },
  {
    label = "args.grid.origin_bottom_left!",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Sets the grid origin to the bottom-left of the screen.]]
    }
  },
  {
    label = "args.grid.origin_center!",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Sets the grid origin to the center of the screen.]]
    }
  },
  {
    label = "args.grid.allscreen_left",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the left coordinate of the allscreen (letterboxed) area.]]
    }
  },
  {
    label = "args.grid.allscreen_right",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the right coordinate of the allscreen (letterboxed) area.]]
    }
  },
  {
    label = "args.grid.render_scale_enum",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Returns the current render scale enumeration value (useful for HD mode).]]
    }
  },
  {
    label = "Kernel.tick_count",
    kind = vim.lsp.protocol.CompletionItemKind.Function,
    documentation = {
      kind = "markdown",
      value = [[Global tick count (frame number) since game start.
Usage: Kernel.tick_count]]
    }
  },
}
