call plug#begin("~/.vim/plugged")

	" ## General Utilities

	Plug 'mhinz/vim-startify'  " Start screen
	Plug 'itchyny/lightline.vim'
	Plug 'akinsho/nvim-bufferline.lua'

	" Theme
	Plug 'dracula/vim'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
	Plug 'Yggdroot/indentLine' "guia de identacion
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'  " Temas para airline
	" Language Client
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	" TypeScript Highlighting
	Plug 'leafgarland/typescript-vim'
	Plug 'peitalin/vim-jsx-typescript'
	" File Explorer with Icons
	Plug 'scrooloose/nerdtree'
	Plug 'ryanoasis/vim-devicons' " Show icons on filetypes
	" File Search
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'ervandew/supertab' "auxiliar tab para deoplete autocompletado
	Plug 'Shougo/echodoc.vim' "muestra firma de funcion
	Plug 'sirver/ultisnips' " provee codigo reutilizable
	Plug 'honza/vim-snippets' " provee codigo reutilizable
	Plug 'w0rp/ale' "Analizador estático asíncrono.
	Plug 'sheerun/vim-polyglot'
	Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
	Plug 'othree/html5.vim', { 'for': 'html' }
	Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
	Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
	Plug 'ludovicchabant/vim-gutentags' "Administrador de archivos tag
	Plug 'ctrlpvim/ctrlp.vim' "Buscador de archivos y buffers.
	Plug 'haya14busa/incsearch.vim' "Búsqueda incremental mejorada.
	Plug 'tpope/vim-surround' "Facilita poner/quitar/cambiar comillas, paréntesis, tags, etc sobre un texto.
	Plug 'tpope/vim-repeat' "Repetir acciones de plugins con ..
	Plug 'tpope/vim-eunuch' "Provee comandos de sistemas UNIX.:Delete :Move :Rename :Chmod :Mkdir
	Plug 'jiangmiao/auto-pairs' "Inserta pares de comillas y paréntesis.
	Plug 'scrooloose/nerdcommenter' "Facilita agregar y quitar comentarios.
	Plug 'tpope/vim-fugitive' "Provee comandos de git.
	Plug 'airblade/vim-gitgutter' "Muestra cambios hechos en el archivo en la columna de signos.
	Plug 'xuyuanp/nerdtree-git-plugin' "Muestra el estado de los archivos en Nerdtree.
	Plug 'lambdalisue/gina.vim'  " Asynchronously Git wrapper
	Plug 'mhinz/vim-sayonara', {'on': 'Sayonara'}  " Close/hide/delete current buffer



call plug#end()
	



	" ## Sayonara
	nnoremap <silent> <leader>q :Sayonara<CR>
	nnoremap <silent> <leader>Q :Sayonara!<CR>
	" Actualizar barra cada 250 mili segundos
	set updatetime=250
	let g:NERDSpaceDelims = 1  " Agregar un espacio después del delimitador del comentario
	let g:NERDTrimTrailingWhitespace = 1  " Quitar espacios al quitar comentario
	" Maps requeridos
	map /  <Plug>(incsearch-forward)
	map ?  <Plug>(incsearch-backward)
	" Quitar resaltado luego de buscar
	let g:incsearch#auto_nohlsearch = 1
	" Archivos ignorados
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
		\ 'file': '\v\.(exe|so|dll)$',
		\ }
	" Ignorar archivos en .gitignore
	let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
	" Nombre del archivo generado
	let g:gutentags_ctags_tagfile = '.tags'
	" Mostrar mejor mensajes de error
	let g:ale_echo_msg_error_str = 'E'
	let g:ale_echo_msg_warning_str = 'W'
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
	" Expandir snippet con Ctrl + j
	let g:UltiSnipsExpandTrigger = '<c-j>'
	" Ir a siguiente ubicacion con Ctrl + j
	let g:UltiSnipsJumpForwardTrigger = '<c-j>'
	" Ir a anterior ubicacion con Ctrl + k
	let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
	set noshowmode  " No mostrar el modo actual (echodoc hace uso de este espacio)
	" Activar echodoc al iniciar Neovim
	let g:echodoc_enable_at_startup = 1
	set colorcolumn=120 " Muestra la columna límite a 120 caracteres
	set cursorline " Resalta la línea actual
	set number " Muestra los números de las líneas
	set hidden  " Permitir cambiar de buffers sin tener que guardarlos
	set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
	set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas
	set background=dark  " Fondo del tema: light o dark
	"neoclide
	let g:coc_global_extensions = [
		\ 'coc-word',
		\ 'coc-syntax',
		\ 'coc-dictionary',
		\ 'coc-snippets',
		\ 'coc-emoji',
		\ 'coc-json',
		\ 'coc-yaml',
		\ 'coc-html',
		\ 'coc-css',
		\ 'coc-python',
		\ 'coc-rls',
		\ 'coc-tsserver',
		\ 'coc-tag',
		\ 'coc-clangd',
		\ 'coc-emmet',
		\ 'coc-prettier',
		\ ]
		" Show documentation using K
	nnoremap <silent> K :call <SID>show_documentation()<CR>
			function! s:show_documentation()
			if index(['vim', 'help'], &filetype) >= 0
			normal! K
		else
			call CocAction('doHover')
		endif
	endfunction

		augroup CocAutocomands
			autocmd!
		" Show function signature while completing args
			autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
			autocmd FileType
			\ json,js,html,c,cpp,h,hh
			\ setlocal formatexpr=CocAction('formatSelected')
		augroup END


	" No mostrar en ciertos tipos de buffers y archivos (autocompletado)
	let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
	let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
	" Invertir direccion de navegacion (de arriba a abajo)
	let g:SuperTabDefaultCompletionType = '<c-n>'
	let g:airline#extensions#tabline#enabled = 1  " Mostrar buffers abiertos (como pestañas)
	let g:airline#extensions#tabline#fnamemod = ':t'  " Mostrar sólo el nombre del archivo
	" Cargar fuente Powerline y símbolos (ver nota)
	let g:airline_powerline_fonts = 1
	set noshowmode  " No mostrar el modo actual (ya lo muestra la barra de estado)
	let g:mapleader = ' '  " Definir espacio como la tecla líder
	nnoremap <leader>s :w<CR>  " Guardar con <líder> + s
	nnoremap <leader>e :e $MYVIMRC<CR>  " Abrir el archivo init.vim con <líder> + e

	" Usar <líder> + y para copiar al portapapeles
	vnoremap <leader>y "+y
	nnoremap <leader>y "+y

	" Usar <líder> + d para cortar al portapapeles
	vnoremap <leader>d "+d
	nnoremap <leader>d "+d

	" Usar <líder> + p para pegar desde el portapapeles
	nnoremap <leader>p "+p
	vnoremap <leader>p "+p
	nnoremap <leader>P "+P
	vnoremap <leader>P "+P

	" Moverse al buffer siguiente con <líder> + l
	nnoremap <leader>l :bnext<CR>

	" Moverse al buffer anterior con <líder> + j
	nnoremap <leader>j :bprevious<CR>

	" Cerrar el buffer actual con <líder> + q
	nnoremap <leader>q :bdelete<CR>
	set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español
	set scrolloff=3  " Display at least 3 lines around you cursor
	set nowrap  " No wrap lines (display long lines)
	set relativenumber  " Show relative line numbers
	set inccommand=nosplit " Show replace live preview
	" Use rg for :grep
	set grepprg=rg\ --vimgrep
	set grepformat=%f:%l:%c:%m
	
	" Enable theming support
		if (has("termguicolors"))
		set termguicolors
	endif
 
                  
	" Theme
		syntax enable
		colorscheme dracula

	" NerdTree
		let g:NERDTreeShowHidden = 1
		let g:NERDTreeMinimalUI = 1
		let g:NERDTreeIgnore = []
		let g:NERDTreeStatusline = ''
		" Automaticaly close nvim if NERDTree is only thing left open
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
		" Toggle
		nnoremap <silent> <C-b> :NERDTreeToggle<CR>
	" Fin NerdTree


		
		" Wrapper de FZF buscador de archivos, buffers, grep, etc.
		" Ejecutar comandos con alt-enter :Commands
		let g:fzf_commands_expect = 'alt-enter'
		" Guardar historial de búsquedas
		let g:fzf_history_dir = '~/.local/share/fzf-history'
		nnoremap <C-p> :FZF<CR>
		let g:fzf_action = {
			\ 'ctrl-t': 'tab split',
			\ 'ctrl-s': 'split',
			\ 'ctrl-v': 'vsplit'
			\}
  "                                    " requires silversearcher-ag
  "                                    " used to ignore gitignore files
                   let $FZF_DEFAULT_COMMAND = 'ag -g ""'

	" open new split panes to right and below
	set splitright
	set splitbelow

	" turn terminal to normal mode with escape
	tnoremap <Esc> <C-\><C-n>

	" use alt+h to move between split/vsplit panels
	tnoremap <A-h> <C-\><C-n><C-w>h
	tnoremap <A-j> <C-\><C-n><C-w>j
	tnoremap <A-k> <C-\><C-n><C-w>k
	tnoremap <A-l> <C-\><C-n><C-w>l
	nnoremap <A-h> <C-w>h
	nnoremap <A-j> <C-w>j
	nnoremap <A-k> <C-w>k
	nnoremap <A-l> <C-w>l


	" open terminal on ctrl+ n;
	" uses zsh instead of bash
	function! OpenTerminal()
		split term://bash
		resize 10
		endfunction
	nnoremap <c-n> :call OpenTerminal()<CR>

	set clipboard=unnamedplus

	" stop cursor keys in normal mode
	noremap <Up> <Nop>
	noremap <Down> <Nop>
	noremap <Left> <Nop>
	noremap <Right> <Nop>

	" better indenting in visual mode with < >
	vnoremap < <gv
	vnoremap > >gv

	" disable recording
	nnoremap q <Nop>

	if exists('g:vscode')

	" don't highlight search items
	set nohlsearch

	" call VSCodeCommentary on the visual selection, and then re-select that visual selection with gv
	xmap <C-/> <Plug>VSCodeCommentarygv
	nmap <C-/> <Plug>VSCodeCommentaryLine

	else

		let g:codedark_conservative = 1
		colorscheme codedark

	" open new split panes to right and below
	set splitright
	set splitbelow

	" " turn terminal to normal mode with escape
	tnoremap <Esc> <C-\><C-n>

	" " start terminal in insert mode

	au BufEnter * if &buftype == 'terminal' | :startinsert | endif

	" converts tabs to spaces
	set expandtab

	" insert 2 spaces for a tab
	set tabstop=2

	  " number of space characters inserted for indentation
	set shiftwidth=2

	" wrap at word boundaries rather than right at the terminal edge
	set linebreak

	" change terminal title to name of file
	set title

	" set spell checking language
	set nospell spelllang=en_us

	inoremap jk <Esc>
	tnoremap jk <C-\><C-n>

	" toggle spell checking in normal and insert mode
	nnoremap <silent> <F6> :set invspell<cr>
	inoremap <silent> <F6> <C-O>:set invspell<cr>

	" toggle buffers
	nnoremap <Tab> :bnext<CR>
	nnoremap <S-Tab> :bprevious<CR>

	" esc to turn off search highlighting
	nnoremap <silent> <esc> :noh<cr>

	" disable accidentally pressing ctrl-z and suspending 
	nnoremap <c-z> <Nop>

	let g:markdown_fenced_languages = ['bash=sh', 'javascript', 'js=javascript', 'json=javascript', 'typescript', 'ts=typescript', 'php', 'html', 'css']

endif
