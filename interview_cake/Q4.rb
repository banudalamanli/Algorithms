############################### PROBLEM:
# Your company built an in-house calendar tool called HiCal. You want to add a feature to see the times in a day when everyone is available. To do this, you’ll need to know when any team is having a meeting. In HiCal, a meeting is stored as a tuple of integers (start_time, end_time) . These integers represent the number of 30-minute blocks past 9:00am.
# For example:
# (2, 3) # meeting from 10:00 – 10:30 am
# (6, 9) # meeting from 12:

# Write a function condense_meeting_times() that takes an array of meeting time ranges and returns an array of condensed ranges. Do not assume the meetings are in order. The meeting times are coming from multiple teams.
# For example, given:
#   [(0, 1), (3, 5), (4, 8), (10, 12), (9, 10)]
# the function would return:
#   [(0, 1), (3, 8), (9, 12)]

# In this case the possibilities for start_time and end_time are bounded by the number of 30-minute slots in a day. But soon you plan to refactor HiCal to store times as Unix timestamps (which are big numbers). Write something that's efficient even when we can't put a nice upper bound on the numbers representing our time ranges.

############ Solution: O(n log n) time and O(n) space. Even though the array of meetings is iterated once to merge them, it is sorted first, giving a runtime of O(n log n). If the input were sorted, the sort would be skipped and giving a runtime of O(n) time!

def condense_meeting_times(array_of_meetings)
  p "#" * 30
  p "#{array_of_meetings}"
  sorted_meetings    = array_of_meetings.sort
  number_of_meetings = array_of_meetings.count

  condensed_meetings = []

  previous_meeting_start = sorted_meetings[0][0]
  previous_meeting_end   = sorted_meetings[0][1]

  p "Starting previous_meeting_start is #{previous_meeting_start}"
  p "Starting previous_meeting_end is #{previous_meeting_end}"

  i = 1
  while i < number_of_meetings
    p "i is: #{i}"
    current_meeting_start = sorted_meetings[i][0]
    current_meeting_end   = sorted_meetings[i][1]

    p "current_meeting_start is : #{current_meeting_start}"
    p "current_meeting_end is   : #{current_meeting_end}"
    p "previous_meeting_start is: #{previous_meeting_start}"
    p "previous_meeting_end is  : #{previous_meeting_end}"

    # WHAT HAPPENS UNDER "IF": We only check whether the current meeting starts before the previous one ends(line 44). In that case we merge them together by setting the previous meeting's end time to whichever of the previous or current meeting ends last(line 47). And we continue with the looping to see whether there are more meetings that start before the previous (now merged) meeting ends and we keep merging them the same way.
    # WHAT HAPPENS UNDER "ELSE": When there is a meeting that doesn't start before the other one ends, we append the previous meeting start and end times as a tuple to the condensed meetings (line 53). Then we set the current meeting's start and end times as previous start and end times(line 54), because we are going to continue to compare the following ones to this new set of times.
    # ONCE WE ARE DONE: We append the last set of previous meeting start and end times to the condensed meetings(line 60).
    if current_meeting_start <= previous_meeting_end
      p "current_meeting_start(#{current_meeting_start}) is <= previous_meeting_end(#{previous_meeting_end})"
      p "so we are setting previous_meeting_end to the bigger one of #{current_meeting_end} and #{previous_meeting_end}, which is #{[current_meeting_end, previous_meeting_end].max}"
      previous_meeting_end = [current_meeting_end, previous_meeting_end].max
    else
      p "current_meeting_start(#{current_meeting_start}) is bigger than previous_meeting_end(#{previous_meeting_end})"
      p "so we append [#{previous_meeting_start}, #{previous_meeting_end}] to condensed_meetings"
      p "and we set previous_meeting_start to current_meeting_start which is #{current_meeting_start}"
      p "and previous_meeting_end to previous_meeting_end which is #{current_meeting_end}"
      condensed_meetings << [previous_meeting_start, previous_meeting_end]
      previous_meeting_start, previous_meeting_end = current_meeting_start, current_meeting_end
    end
    i += 1
  end
  p "---> Out of the while loop we append the previous_meeting_start and previous_meeting_end which is [#{previous_meeting_start}, #{previous_meeting_end}] to condensed_meetings"
  p "***And that is it***"
  condensed_meetings << [previous_meeting_start, previous_meeting_end]
  p "#{condensed_meetings}"
  condensed_meetings
end

####################################################################################

# DRIVER TESTS

meetings1 = [[1, 3], [2, 4]]
meetings2 = [[1, 2], [2, 3]]
meetings3 = [[1, 5], [2, 3]]
meetings4 = [[1, 10], [2, 6], [3, 5], [7,9]]
meetings5 = [[0, 1], [3, 5], [4, 8], [10, 12], [9, 10]]


p condense_meeting_times(meetings1) == [[1, 4]]
p condense_meeting_times(meetings2) == [[1, 3]]
p condense_meeting_times(meetings3) == [[1, 5]]
p condense_meeting_times(meetings4) == [[1, 10]]
p condense_meeting_times(meetings5) == [[0, 1], [3, 8], [9, 12]]

