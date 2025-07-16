import subprocess
import uuid
import os

def generate_tts(text, lang="de"):
    output_file = f"/tmp/{uuid.uuid4()}.wav"

    # Call fish-speech CLI tool to generate speech
    cmd = [
        "python",
        "tools/tts_to_file.py",
        "--text", text,
        "--output_path", output_file,
        "--lang", lang
    ]
    subprocess.run(cmd, check=True)
    return output_file
