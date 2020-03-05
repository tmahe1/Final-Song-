intro = "C:/Users/yutaka_mahe/Downloads/keepmovinforward.wav"
heat = "C:/Users/yutaka_mahe/Downloads/heatpt2.wav"
rocky = "C:/Users/yutaka_mahe/Downloads/maybe1.wav"
suck = "C:/Users/yutaka_mahe/Downloads/You Suck!.wav"
boo = "C:/Users/yutaka_mahe/Downloads/Patrick - Boo.wav"
stink = "C:/Users/yutaka_mahe/Downloads/BOO, YOU STINK! (Spongebob Squarepants).wav"
leg = "C:/Users/yutaka_mahe/Downloads/My Leg!!!.wav"
sayless= "C:/Users/yutaka_mahe/Downloads/saylesss.wav"
box = "C:/Users/yutaka_mahe/Downloads/CARTERRRR.wav"
outro = "C:/Users/yutaka_mahe/Downloads/pt3.wav"


use_bpm 117
t=0
define :notes do
  play:c
  play:e 
end
define :egc do
  play :e3, sustain:4
  play :gb4, sustain:4
  play :cb5, sustain:4
end
define :bdb do
  play :bb4, sustain:4
  play :db5, sustain:4
  play :bb5, sustain:4
end
define :dfc do
  play :db4
  play :f3
  play :cb5
end
#Intro
sample intro, amp: 10
wait 56

#Song 1
live_loop :water do
  12.times do
    use_synth :piano
    play notes
    sleep 1
    play notes
    sleep 1
    play notes
    sleep 0.5
    play:a
    sleep 0.5
    play:a
    sleep 0.5
    play:b
    sleep 1
  end
  stop
end
wait 20
array = [:drum_bass_hard,:drum_cymbal_closed]
i=0
live_loop :fire do
  20.times do
    2.times do
      sample array [i]
      sleep 1
      i=i+1
    end
    i=0
  end
  stop
end
wait 20
x=0
live_loop :earth do
  5.times do
    sample :ambi_choir, amp: x
    sleep 4
    x=x+0.5
  end
  stop
end
wait 20
x=1.5
6.times do
  use_synth :piano
  play notes, amp: x
  sleep 1
  play notes, amp: x
  sleep 1
  play notes, amp: x
  sleep 0.5
  play:a, amp: x
  sleep 0.5
  play:a, amp: x
  sleep 0.5
  play:b, amp: x
  sleep 1
  x=x-0.25
end


#Transition
print sample_duration sayless
2.times do
  sample choose ([suck, leg, stink, boo ])
  sleep 2
end
sleep 2
play sample sayless
sleep 17

#Song 2
use_synth :piano
sample box, amp: 2
sleep 3
play :bb4
sleep 0.15
play :c4
sleep 0.15
play :db5
sleep 0.15
play :eb5
sleep 0.15
play :f5
sleep 0.15
play :gb5
sleep 0.15
play :ab4
sleep 0.15
live_loop :melody do
  1.times do
    play bdb
    sleep 4
    play bdb
    sleep 3
    play :db4, amp:5
    sleep 1
    play egc
    sleep 4
    play egc
    sleep 3
    play :db4, amp:5
    sleep 1
    play dfc
    sleep 3
    play :db4, amp:5
    sleep 1
    play dfc
    sleep 3
    play :db4, amp:5
    sleep 1
    play egc
    sleep 3
    play :db4, amp:5
    sleep 1
    play :f3
    play :ab3
    play :cb5
  end
  stop
end
define :function do
  play :bb2, sustain:4
  play :f3, sustain:4
  sleep 2
  play :bb2, sustain:2
  play :bb1, sustain:2
  sleep 2
end

live_loop :track do
  1.times do
    play :bb2, sustain:2
    play :bb1, sustain:2
    sleep 2
    play :bb2, sustain:2
    play :f3, sustain:2
    sleep 2
    play :f3, sustain:2
    play :bb3, sustain:2
    play :db, sustain:2
    sleep 2
    4.times do
      play function
    end
    play :e2, sustain:4
    play :bb3, sustain:4
    play :e2, sustain:4
    sleep 2
    play :gb3
    play :f2
    sleep 2
  end
  wait 88
  t=3
  stop
end
#Outro
live_loop :outro do
  if t == 3
    sample outro, amp: 10
    stop
  end
  sleep 1
end
print "THE END"