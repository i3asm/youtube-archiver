import subprocess

def read_urls(file_path):
    with open(file_path, 'r') as file:
        return [line.strip() for line in file if line.strip()]

def download_videos(urls):
    for url in urls:
        # Ensure the '-o' option specifies the directory structure you want
        # Here, downloads are organized into directories named after the uploader
        subprocess.call([
            'yt-dlp',
            '--download-archive', 'downloaded.txt',  # Keeps track of downloaded videos
            '-i',  # Continue on download errors
            '--yes-playlist',
            '-o', 'downloaded/%(channel)s/%(title)s.%(ext)s',  # Organizes files into directories by uploader
            url
        ])

if __name__ == "__main__":
    print('start')
    urls = read_urls('/app/channels_and_playlists.txt')
    download_videos(urls)
