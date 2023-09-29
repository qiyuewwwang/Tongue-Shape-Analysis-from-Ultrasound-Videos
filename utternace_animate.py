import os
input_path = "C:\\Users\AT75690\Desktop\Tal corpus\TaL1\core\day6"
file = "002_cal"
output_path = "output"
if not os.path.exists(output_path):
    os.makedirs(output_path)
prompt = os.path.join(input_path, file + ".txt")
wave = os.path.join(input_path, file + ".wav")
ultrasound = os.path.join(input_path, file + ".ult")
parameter = os.path.join(input_path, file + ".param")


from ustools.animate_utterance import animate_utterance
animate_utterance(prompt, wave, ultrasound, parameter, "C:\\Users\AT75690\Desktop\Tal corpus\\fractive\sh\\day6_she_002.avi", frame_rate=60)


