defmodule ParallelMarkets.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :address, :string
    field :dob, :date
    field :first_name, :string
    field :last_name, :string
    field :phone, :string
    field :state, :string
    field :zip, :string

    has_one :investor, ParallelMarkets.MarketPlace.Investor
    has_many :uploads, ParallelMarkets.Documents.Upload

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :dob, :phone, :address, :state, :zip])
    |> validate_required([:first_name, :last_name, :dob, :phone, :address, :state, :zip])
  end
end
