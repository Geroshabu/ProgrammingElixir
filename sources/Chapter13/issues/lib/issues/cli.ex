defmodule Issues.CLI do
  @default_count 4

  @moduledoc """
  GitHubのIssueを表にして表示するプログラムの
  コマンドライン引数を解析するモジュール。
  """

  def run(argv) do
    parse_args(argv)
  end

  @doc """
  `argv`が -h や --help のときは、:help を返す。
  そうでない場合はユーザー名、リポジトリ名、表示したいIssueの数(オプション)
  を受け取る。

  `{ user, project, count }` か `:help` を返す。
  """
  def parse_args(argv) do
    parse = OptionParser.parse(
      argv,
      switches: [ help: :boolean],
      aliases:  [ h:    :help ])

    case parse do
      { [ help: true ], _, _ } -> :help
      { _, [ user, project, count ], _ } -> { user, project, count }
      { _, [ user, project ], _ } -> { user, project, @default_count }
      _ -> :help
    end
  end
end
