Initial Model Building (Chapter 1):

  User:
    has_many :trips
      - Name
      - Email
      - Password
      - Location
      - Age (D.O.B)

  Trips / (Itinerary):
    belongs_to :user
    has_many :triptags
    has_many :destinations
    has_many :activities, through: :destination
      - budget
      - date range (start date and end date)
      - total guests (integer)
      - user_id

  Destination:
    - City
    - State
    - Country

  TripDestinations:
    - trip_id
    - destination_id

  Packing List:
    belongs_to :user
    belongs_to :trip
      - name
      - user_id
      - trip_id

  Item:
    belongs_to :packing_list
      - name
      - list_id

  Activities:
    belongs_to :destination
    has_many :categoryactivities
      - Name
      - Cost
      - Category
      - Physical Activity Level 
      - Number of people needed
      - destination_id (which we can pull location from)

  CategoryActivities:
    belongs_to :category
    belongs_to :activity
      - category_id
      - activity_id

  Category:
    has_many :categoryactivities
      - Name

  Tags (for trips):
    has_many TripTags
      - Name (which is the category)

  TripTags:
    belongs_to :tag
    belongs_to :trip
      - tag_id
      - trip_id

  Admin:
    - Only accessible to admin
    - Analytics

  Random Notes:
    - Setting trips/itineraries as private vs public
    - Setting up emails 

