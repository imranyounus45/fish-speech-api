from fastapi import FastAPI, Request
from fastapi.responses import FileResponse
from pydantic import BaseModel
import uuid
from models.model_loader import generate_tts

app = FastAPI()

class TTSRequest(BaseModel):
    text: str
    lang: str = "de"

@app.post("/tts")
async def tts(req: TTSRequest):
    output_path = generate_tts(req.text, lang=req.lang)
    return FileResponse(output_path, media_type="audio/wav")
