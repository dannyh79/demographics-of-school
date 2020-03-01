defmodule Util do
  @moduledoc """

  Util module for converting data for School.classes

  """

  def add_role(%{teacher: t, assistants: nil, students: s}) when is_map(s) do
    []
    |> List.insert_at(0, Map.merge(t, %{role: "staff"}))
    |> List.insert_at(0, Map.merge(s, %{role: "student"}))
  end

  def add_role(%{teacher: t, assistants: nil, students: s}) when is_list(s) do
    []
    |> List.insert_at(0, Map.merge(t, %{role: "staff"}))
    |> Enum.concat(Enum.map(s, fn s -> Map.merge(s, %{role: "student"}) end))
  end

  def add_role(%{teacher: t, assistants: a, students: s})
      when is_map(a) and is_list(s) do
    []
    |> List.insert_at(0, Map.merge(t, %{role: "staff"}))
    |> List.insert_at(0, Map.merge(a, %{role: "staff"}))
    |> Enum.concat(Enum.map(s, fn s -> Map.merge(s, %{role: "student"}) end))
  end

  def add_role(%{teacher: t, assistants: a, students: s})
      when is_list(a) and is_list(s) do
    []
    |> List.insert_at(0, Map.merge(t, %{role: "staff"}))
    |> Enum.concat(Enum.map(a, fn a -> Map.merge(a, %{role: "staff"}) end))
    |> Enum.concat(Enum.map(s, fn s -> Map.merge(s, %{role: "student"}) end))
  end

  def add_role(_), do: []

  def format_person(%{first_name: f, last_name: l, role: r}) do
    %{first_name: f, full_name: "#{f} #{l}", role: r}
  end

  def group_by_first_name({role, people}) do
    sorted =
      people
      |> Enum.group_by(&Map.get(&1, :first_name), &Map.get(&1, :full_name))

    Enum.into(%{}, %{role => sorted})
  end

  def over_30?(%{age: age}) do
    age >= 30
  end
end
