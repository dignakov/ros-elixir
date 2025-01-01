# Config File Fixes

## 1
change the Config imports


# Initial Compile

mix compile
    warning: use Mix.Config is deprecated. Use the Config module instead
    │
  1 │ use Mix.Config
    │ ~~~~~~~~~~~~~~
    │
    └─ config/config.exs:1

    warning: Mix.Config.config/2 is deprecated. Use the Config module instead
    │
  4 │ config :ros,
    │ ~~~~~~~~~~~~
    │
    └─ config/config.exs:4

    warning: Mix.Config.config/3 is deprecated. Use the Config module instead
    │
  8 │ config :logger, :console,
    │ ~~~~~~~~~~~~~~~~~~~~~~~~~
    │
    └─ config/config.exs:8

    warning: Mix.Config.import_config/1 is deprecated. Use the Config module instead
    │
 12 │ import_config "#{Mix.env()}.exs"
    │ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    │
    └─ config/config.exs:12

    warning: use Mix.Config is deprecated. Use the Config module instead
    │
  1 │ use Mix.Config
    │ ~~~~~~~~~~~~~~
    │
    └─ config/dev.exs:1

    warning: Mix.Config.config/3 is deprecated. Use the Config module instead
    │
  4 │ config :logger, :console, format: "[$level] $message\n"
    │ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    │
    └─ config/dev.exs:4

==> decimal
Compiling 4 files (.ex)
Generated decimal app
==> nimble_parsec
Compiling 4 files (.ex)
Generated nimble_parsec app
==> ros
===> Analyzing applications...
===> Compiling unicode_util_compat
===> Analyzing applications...
===> Compiling idna
===> Analyzing applications...
===> Compiling erlsom
==> xmlrpc
Compiling 5 files (.ex)
Generated xmlrpc app
==> mox
Compiling 3 files (.ex)
     warning: Code.ensure_compiled?/1 is deprecated. Use Code.ensure_compiled/1 instead (see the proper disclaimers in its docs)
     │
 229 │       not Code.ensure_compiled?(behaviour) ->
     │                ~
     │
     └─ lib/mox.ex:229:16: Mox.validate_behaviour!/1
     └─ lib/mox.ex:522:16: Mox.validate_mock!/1

Generated mox app
==> ros
===> Analyzing applications...
===> Compiling mimerl
===> Analyzing applications...
===> Compiling ranch
==> ssl_verify_fun
Compiling 7 files (.erl)
Generated ssl_verify_fun app
==> dialyxir
Compiling 5 files (.ex)
    warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
    You may run "mix format --migrate" to fix this warning automatically.
    │
 65 │     app_file = Atom.to_charlist(app) ++ '.app'
    │                                         ~
    │
    └─ lib/dialyxir/plt.ex:65:41

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 110 │     beam = Atom.to_charlist(module) ++ '.beam'
     │                                        ~
     │
     └─ lib/dialyxir/plt.ex:110:40

     warning: Mix.Project.compile/1 is deprecated. Use Mix.Task.run("compile", args) instead
     │
 100 │       unless opts[:no_compile], do: Mix.Project.compile([])
     │                                                 ~
     │
     └─ lib/mix/tasks/dialyzer.ex:100:49: Mix.Tasks.Dialyzer.run/1

    warning: Mix.Project.compile/1 is deprecated. Use Mix.Task.run("compile", args) instead
    │
 34 │     Mix.Project.compile([]) # compile & load current project paths
    │                 ~
    │
    └─ lib/dialyxir/project.ex:34:17: Dialyxir.Project.cons_apps/0

Generated dialyxir app
==> ros
===> Analyzing applications...
===> Compiling certifi
==> makeup
Compiling 15 files (.ex)
Generated makeup app
==> makeup_elixir
Compiling 6 files (.ex)
Generated makeup_elixir app
==> ros
===> Analyzing applications...
===> Compiling parse_trans
===> Analyzing applications...
===> Compiling metrics
===> Analyzing applications...
===> Compiling hackney
==> private
Compiling 1 file (.ex)
Generated private app
==> bite
Compiling 1 file (.ex)
     warning: this clause of defp to_big_endian/1 is never used
     │
 251 │     defp to_big_endian(%Bite{endian: :big} = bite), do: bite
     │          ~
     │
     └─ lib/bite.ex:251:10: Bite.to_big_endian/1

Generated bite app
==> earmark
Compiling 2 files (.xrl)
Compiling 1 file (.yrl)
Compiling 3 files (.erl)
Compiling 61 files (.ex)
    warning: Tuple.append/2 is deprecated. Use insert_at instead
    │
 65 │     tag_tpl |> Tuple.append(Enum.reverse(lines)) |> Tuple.append(@verbatim)
    │                      ~
    │
    └─ lib/earmark_parser/helpers/html_parser.ex:65:22: Earmark.Parser.Helpers.HtmlParser._parse_rest/3
    └─ lib/earmark_parser/helpers/html_parser.ex:65:59: Earmark.Parser.Helpers.HtmlParser._parse_rest/3
    └─ lib/earmark_parser/helpers/html_parser.ex:69:39: Earmark.Parser.Helpers.HtmlParser._parse_rest/3
    └─ lib/earmark_parser/helpers/html_parser.ex:69:88: Earmark.Parser.Helpers.HtmlParser._parse_rest/3
    └─ lib/earmark_parser/helpers/html_parser.ex:70:39: Earmark.Parser.Helpers.HtmlParser._parse_rest/3
    └─ lib/earmark_parser/helpers/html_parser.ex:70:76: Earmark.Parser.Helpers.HtmlParser._parse_rest/3
    └─ lib/earmark_parser/helpers/html_parser.ex:71:40: Earmark.Parser.Helpers.HtmlParser._parse_rest/3
    └─ lib/earmark_parser/helpers/html_parser.ex:71:77: Earmark.Parser.Helpers.HtmlParser._parse_rest/3

Generated earmark app
==> ex_doc
Compiling 18 files (.ex)
     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 123 │       [{'mimetype', @mimetype} | files_to_add(output)],
     │         ~
     │
     └─ lib/ex_doc/formatter/epub.ex:123:9

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 124 │       compress: ['.css', '.xhtml', '.html', '.ncx', '.js', '.opf', '.jpg', '.png', '.xml']
     │                  ~
     │
     └─ lib/ex_doc/formatter/epub.ex:124:18

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 124 │       compress: ['.css', '.xhtml', '.html', '.ncx', '.js', '.opf', '.jpg', '.png', '.xml']
     │                          ~
     │
     └─ lib/ex_doc/formatter/epub.ex:124:26

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 124 │       compress: ['.css', '.xhtml', '.html', '.ncx', '.js', '.opf', '.jpg', '.png', '.xml']
     │                                    ~
     │
     └─ lib/ex_doc/formatter/epub.ex:124:36

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 124 │       compress: ['.css', '.xhtml', '.html', '.ncx', '.js', '.opf', '.jpg', '.png', '.xml']
     │                                             ~
     │
     └─ lib/ex_doc/formatter/epub.ex:124:45

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 124 │       compress: ['.css', '.xhtml', '.html', '.ncx', '.js', '.opf', '.jpg', '.png', '.xml']
     │                                                     ~
     │
     └─ lib/ex_doc/formatter/epub.ex:124:53

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 124 │       compress: ['.css', '.xhtml', '.html', '.ncx', '.js', '.opf', '.jpg', '.png', '.xml']
     │                                                            ~
     │
     └─ lib/ex_doc/formatter/epub.ex:124:60

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 124 │       compress: ['.css', '.xhtml', '.html', '.ncx', '.js', '.opf', '.jpg', '.png', '.xml']
     │                                                                    ~
     │
     └─ lib/ex_doc/formatter/epub.ex:124:68

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 124 │       compress: ['.css', '.xhtml', '.html', '.ncx', '.js', '.opf', '.jpg', '.png', '.xml']
     │                                                                            ~
     │
     └─ lib/ex_doc/formatter/epub.ex:124:76

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 124 │       compress: ['.css', '.xhtml', '.html', '.ncx', '.js', '.opf', '.jpg', '.png', '.xml']
     │                                                                                    ~
     │
     └─ lib/ex_doc/formatter/epub.ex:124:84

     warning: atom ::: must be written between quotes, as in :"::", to avoid ambiguity
     │
 214 │         {:::, _, [{name, meta, args}, right]}, placeholders
     │          ~
     │
     └─ lib/ex_doc/formatter/html/autolink.ex:214:10

     warning: atom ::: must be written between quotes, as in :"::", to avoid ambiguity
     │
 216 │           {{:::, [], [{{ref, name}, meta, args}, right]}, placeholders}
     │             ~
     │
     └─ lib/ex_doc/formatter/html/autolink.ex:216:13

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 527 │     case :code.where_is_file('#{module}.beam') do
     │                              ~
     │
     └─ lib/ex_doc/formatter/html/autolink.ex:527:30

     warning: single-quoted strings represent charlists. Use ~c"" if you indeed want a charlist or use "" instead.
     You may run "mix format --migrate" to fix this warning automatically.
     │
 562 │       case :code.where_is_file('Elixir.Kernel.beam') do
     │                                ~
     │
     └─ lib/ex_doc/formatter/html/autolink.ex:562:32

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 89 │     <%# Extra content needed by the current markdown processor (e.g. custom Javascript) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/epub/templates/module_template.eex:89: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 91 │     <%# Extra content specified by the user (e.g. custom Javascript) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/epub/templates/module_template.eex:91: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 20 │     <%# Extra content needed by the current markdown processor (e.g. custom Javascript) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/epub/templates/nav_template.eex:20: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 22 │     <%# Extra content specified by the user (e.g. custom Javascript) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/epub/templates/nav_template.eex:22: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
  3 │     <%# Extra content needed by the current markdown processor (i.g. custom Javascript) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/epub/templates/extra_template.eex:3: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
  5 │     <%# Extra content specified by the user (e.g. custom Javascript) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/epub/templates/extra_template.eex:5: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
  9 │     <%# Extra content needed by the current markdown processor (e.g. custom Javascipt) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/epub/templates/title_template.eex:9: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 11 │     <%# Extra content specified by the user (e.g. custom Javascipt) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/epub/templates/title_template.eex:11: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 10 │     <%# Extra content needed by the current markdown processor (e.g. custom CSS) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/epub/templates/head_template.eex:10: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 12 │     <%# Extra content specified by the user (e.g. custom CSS) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/epub/templates/head_template.eex:12: (file)

     warning: atom ::: must be written between quotes, as in :"::", to avoid ambiguity
     │
 402 │   defp process_type_ast({:::, _, [d | _]}, :opaque), do: d
     │                          ~
     │
     └─ lib/ex_doc/retriever.ex:402:26

     warning: atom ::: must be written between quotes, as in :"::", to avoid ambiguity
     │
 405 │   defp get_typespec_signature({:when, _, [{:::, _, [{name, meta, args}, _]}, _]}, arity) do
     │                                            ~
     │
     └─ lib/ex_doc/retriever.ex:405:44

     warning: atom ::: must be written between quotes, as in :"::", to avoid ambiguity
     │
 409 │   defp get_typespec_signature({:::, _, [{name, meta, args}, _]}, arity) do
     │                                ~
     │
     └─ lib/ex_doc/retriever.ex:409:32

     warning: atom ::: must be written between quotes, as in :"::", to avoid ambiguity
     │
 422 │       {{:::, _, [left, _]}, i} -> to_var(left, i)
     │         ~
     │
     └─ lib/ex_doc/retriever.ex:422:9

     warning: atom ::: must be written between quotes, as in :"::", to avoid ambiguity
     │
 465 │   defp remove_first_macro_arg({:::, info, [{name, info2, [_term_arg | rest_args]}, return]}) do
     │                                ~
     │
     └─ lib/ex_doc/retriever.ex:465:32

     warning: atom ::: must be written between quotes, as in :"::", to avoid ambiguity
     │
 466 │     {:::, info, [{name, info2, rest_args}, return]}
     │      ~
     │
     └─ lib/ex_doc/retriever.ex:466:6

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 18 │   <%# Extra content needed by the current markdown processor (e.g. custom Javascript) %>
    │   ~
    │
    └─ lib/ex_doc/formatter/html/templates/footer_template.eex:18: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 20 │   <%# Extra content specified by the user (e.g. custom Javascript) %>
    │   ~
    │
    └─ lib/ex_doc/formatter/html/templates/footer_template.eex:20: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 14 │     <%# Extra content needed by the current markdown processor (e.g. custom CSS) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/html/templates/head_template.eex:14: (file)

    warning: <%# is deprecated, use <%!-- or add a space between <% and # instead
    │
 16 │     <%# Extra content specified by the user (e.g. custom CSS) %>
    │     ~
    │
    └─ lib/ex_doc/formatter/html/templates/head_template.eex:16: (file)

Generated ex_doc app
==> satchel
Compiling 1 file (.ex)
Generated satchel app
==> httpoison
Compiling 3 files (.ex)
Generated httpoison app
==> xenium
Compiling 2 files (.ex)
Generated xenium app
==> ros
===> Analyzing applications...
===> Compiling cowlib
===> Analyzing applications...
===> Compiling cowboy
Compiling 22 files (.ex)
    warning: Logger.warn/1 is deprecated. Use Logger.warning/2 instead
    │
 77 │     Logger.warn(fn -> "no implementation for #{fun} in slave api" end)
    │            ~
    │
    └─ lib/ros/slave_api.ex:77:12: ROS.SlaveApi.handle_call/3

     warning: incompatible types given to Satchel.pack/2:

         Satchel.pack(:uint32, length(list))

     given types:

         :uint32, integer()

     but expected one of:

         #1
         dynamic(), dynamic(:bool)

         #2
         dynamic(), dynamic(:int8)

         #3
         dynamic(), dynamic(:uint8)

         #4
         dynamic(), dynamic(:int16)

         #5
         dynamic(), dynamic(:uint16)

         #6
         dynamic(), dynamic(:int32)

         #7
         dynamic(), dynamic(:uint32)

         #8
         dynamic(), dynamic(:int64)

         #9
         dynamic(), dynamic(:uint64)

         #10
         dynamic(), dynamic(:float32)

         #11
         dynamic(), dynamic(:float64)

         #12
         dynamic(), dynamic(:string)

         #13
         dynamic({term(), term()}), dynamic(:time)

         #14
         dynamic({term(), term()}), dynamic(:duration)

     where "list" was given the type:

         # type: dynamic()
         # from: lib/ros/message.ex:127:25
         list

     typing violation found at:
     │
 128 │       serialized_length = Satchel.pack(:uint32, length(list))
     │                                   ~
     │
     └─ lib/ros/message.ex:128:35: ROS.Message.serialize_list/2

Generated ros app