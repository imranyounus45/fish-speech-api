import os
import uuid
from fish_speech import FishTTS

tts_model = FishTTS()  # Load once

def generate_tts(text, lang="de"):
    output_file = f"/tmp/{uuid.uuid4()}.wav"
    tts_model.tts_to_file(text=text, file_path=output_file, lang=lang)
    return output_file
