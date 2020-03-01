defmodule School do
  @moduledoc """
  #
  #classes

  > retrieves data of classes

  #demographics

  > first filters out people that are less than 30, grouped by role and first name

  """

  @classes [
    %{
      name: "1A",
      teacher: %{
        age: 28,
        first_name: "Tricia",
        last_name: "Garrett"
      },
      assistants: %{
        age: 38,
        first_name: "Liliana",
        last_name: "Kidd"
      },
      students: [
        %{
          age: 46,
          first_name: "Luz",
          last_name: "Casey"
        },
        %{
          age: 38,
          first_name: "Rosemary",
          last_name: "Barber"
        }
      ]
    },
    %{
      name: "1B",
      teacher: %{
        age: 43,
        first_name: "Ollie",
        last_name: "Matthews"
      },
      assistants: nil,
      students: [
        %{
          age: 45,
          first_name: "Ollie",
          last_name: "Sandoval"
        },
        %{
          age: 27,
          first_name: "Gale",
          last_name: "Coleman"
        }
      ]
    },
    %{
      name: "2A",
      teacher: %{
        age: 49,
        first_name: "Liza",
        last_name: "Vega"
      },
      assistants: %{
        age: 48,
        first_name: "Tricia",
        last_name: "Brewer"
      },
      students: [
        %{
          age: 24,
          first_name: "Ophelia",
          last_name: "Roy"
        },
        %{
          age: 40,
          first_name: "Ophelia",
          last_name: "Sears"
        },
        %{
          age: 37,
          first_name: "Gale",
          last_name: "Strong"
        }
      ]
    },
    %{
      name: "2B",
      teacher: %{
        age: 24,
        first_name: "Rochelle",
        last_name: "Wilcox"
      },
      assistants: [
        %{
          age: 32,
          first_name: "Gale",
          last_name: "Christensen"
        },
        %{
          age: 46,
          first_name: "Luz",
          last_name: "Crawford"
        },
        %{
          age: 38,
          first_name: "Rosemary",
          last_name: "Casey"
        }
      ],
      students: [
        %{
          age: 42,
          first_name: "Gale",
          last_name: "Joseph"
        },
        %{
          age: 38,
          first_name: "Ophelia",
          last_name: "Crawford"
        },
        %{
          age: 45,
          first_name: "Gale",
          last_name: "Bowers"
        }
      ]
    }
  ]
  def classes, do: @classes

  def demographics do
    @classes
    |> Enum.flat_map(&Util.add_role/1)
    |> Enum.filter(&Util.over_30?/1)
    |> Enum.map(&Util.format_person/1)
    |> Enum.group_by(&Map.get(&1, :role))
    |> Enum.map(&Util.group_by_first_name/1)
    |> Enum.reduce(%{}, fn by_role_people, acc ->
      Map.merge(acc, by_role_people)
    end)
  end
end
