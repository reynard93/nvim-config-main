local M = {}

M.config = {
	keywords = {
		FIX = {
			icon = " ", -- icon used for the sign, and in search results
			color = "error", -- can be a hex color, or a named color (see below)
			alt = { "fix", "bug" }, -- a set of other keywords that all map to this FIX keywords
		},
		TODO = { icon = " ", color = "info" },
		HACK = { icon = " ", color = "warning" },
		WARN = {
			icon = " ",
			color = "warning",
			alt = { "warning", "xxx" },
		},
		PERF = { icon = " ", alt = { "perf" } },
		NOTE = { icon = " ", color = "hint", alt = { "note", "info" } },
	},
	-- highlighting of the line containing the todo comment
	-- * before: highlights before the keyword (typically comment characters)
	-- * keyword: highlights of the keyword
	-- * after: highlights after the keyword (todo text)
	highlight = {
		before = "", -- "fg" or "bg" or empty
		keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
		after = "fg", -- "fg" or "bg" or empty
		pattern = [[.*<(\iKEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
		comments_only = true, -- uses treesitter to match keywords in comments only
		max_line_len = 400, -- ignore lines longer than this
		exclude = { "txt", "man", "markdown" }, -- list of file types to exclude highlighting
	},
	colors = {
		error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
		warning = { "DiagnosticWarning", "WarningMsg", "#FBBF24" },
		info = { "DiagnosticInfo", "#2563EB" },
		hint = { "DiagnosticHint", "#10B981" },
		default = { "Identifier", "#7C3AED" },
		test = { "Identifier", "#FF00FF" },
	},
	search = {
		command = "rg",
		args = {
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--ignore-case",
		},
		-- regex that will be used to match keywords.
		-- don't replace the (KEYWORDS) placeholder
		pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
	},
}

M.setup = function()
	local status_ok, todo_comments = pcall(require, "todo-comments")
	if not status_ok then
		return
	end
	todo_comments.setup(M.config)
end

return M
