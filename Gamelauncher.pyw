import tkinter as tk
from tkinter import filedialog
import os
import pygame
import webbrowser  # Für das Öffnen von Links
from PIL import Image, ImageTk

# Initialisierung von pygame für den Sound
pygame.mixer.init()

# Funktion zum Auswählen der EXE-Datei
def open_file():
    filepath = filedialog.askopenfilename(filetypes=[("Executable Files", "*.exe")])
    if filepath:
        exe_listbox.insert(tk.END, filepath)
        save_exe_list()

# Funktion zum Speichern der EXE-Dateien in einer Textdatei
def save_exe_list():
    with open("exe_list.txt", "w") as f:
        for item in exe_listbox.get(0, tk.END):
            f.write(item + "\n")

# Funktion zum Laden der gespeicherten EXE-Dateien
def load_exe_list():
    if os.path.exists("exe_list.txt"):
        with open("exe_list.txt", "r") as f:
            for line in f:
                exe_listbox.insert(tk.END, line.strip())

# Funktion zum Ausführen eines ausgewählten Spiels
def run_game():
    selected_game = exe_listbox.curselection()
    if selected_game:
        os.startfile(exe_listbox.get(selected_game))

# Funktion zum Abspielen des Sounds
def play_sound():
    pygame.mixer.music.load("ncs.mp3")  # NCS MP3 im gleichen Ordner
    pygame.mixer.music.play(loops=0, start=0.0)

# Funktion zum Anzeigen eines GIFs
def display_gif():
    gif_path = "text.gif"  # GIF-Datei im gleichen Ordner (jetzt text.gif)
    img = Image.open(gif_path)
    img = ImageTk.PhotoImage(img)
    gif_label.config(image=img)
    gif_label.image = img
    gif_label.after(100, display_gif)

# Funktion zum Öffnen des YouTube-Kanals
def open_youtube():
    url = "https://youtube.com/@gigarazorlp1911?si=7NIE_xkveQTeUGhI"
    webbrowser.open(url)

# Erstellen des Fensters
root = tk.Tk()
root.title("Gaming Launcher")
root.geometry("800x600")
root.config(bg="purple")  # Hintergrundfarbe lila

# Alpha-Gradient für die Suchleiste
search_var = tk.StringVar()

# Textbox und Listbox für die Exe-Dateien
search_entry = tk.Entry(root, textvariable=search_var, font=("Arial", 12), fg="black", bg="purple", insertbackground="black")
search_entry.pack(pady=10)

exe_listbox = tk.Listbox(root, selectmode=tk.SINGLE, font=("Arial", 12), bg="purple", fg="black", highlightcolor="purple")
exe_listbox.pack(pady=10, fill=tk.BOTH, expand=True)
load_exe_list()

# Buttons für Funktionalitäten
open_button = tk.Button(root, text="Spiel Hinzufügen", command=open_file, bg="purple", fg="black", font=("Arial", 12))
open_button.pack(pady=5, side=tk.LEFT, padx=10)

run_button = tk.Button(root, text="Spiel Starten", command=run_game, bg="purple", fg="black", font=("Arial", 12))
run_button.pack(pady=5, side=tk.LEFT, padx=10)

sound_button = tk.Button(root, text="Sound Abspielen", command=play_sound, bg="purple", fg="black", font=("Arial", 12))
sound_button.pack(pady=5, side=tk.LEFT, padx=10)

# YouTube Button rechts
youtube_button = tk.Button(root, text="YouTube GigaRazorLP", command=open_youtube, bg="purple", fg="black", font=("Arial", 12))
youtube_button.pack(pady=5, side=tk.RIGHT, padx=10)

# Label für das GIF
gif_label = tk.Label(root)
gif_label.pack(pady=20, side=tk.TOP, expand=True)

# Label für den Text "Powered by GigaRazorLP LP"
footer_label = tk.Label(root, text="Powered by GigaRazorLP LP", fg="black", bg="purple", font=("Arial", 12, "italic"))
footer_label.pack(side=tk.BOTTOM, pady=10)

# Starten der GIF-Darstellung
display_gif()

# Hauptloop für die GUI
root.mainloop()
