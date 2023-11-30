FROM nvidia/cuda:12.3.0-runtime-ubuntu22.04

ADD assets /app/assets/
ADD configs /app/configs/
ADD data /app/data/
ADD requirements /app/requirements/
ADD scripts /app/scripts/
ADD sgm /app/sgm/

WORKDIR /app/
RUN apt update && apt install -y python3-pip git libgl1
RUN pip3 install -r requirements/pt2.txt
RUN apt install -y libglib2.0-0 ffmpeg
RUN mkdir /app/outputs/
EXPOSE 8501
CMD python3 -m streamlit run scripts/demo/video_sampling.py