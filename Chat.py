import socket
import threading
import tkinter as tk
from tkinter.scrolledtext import ScrolledText  # Korrekte Importzeile

# Funktion für den Server
def start_server(host, port, output_box):
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((host, port))
    server_socket.listen(5)
    output_box.insert(tk.END, f"Server gestartet auf {host}:{port}\n")

    # Liste für verbundene Clients
    clients = []

    def handle_client(client_socket, client_address):
        output_box.insert(tk.END, f"Verbindung von {client_address} hergestellt\n")
        clients.append(client_socket)
        while True:
            try:
                message = client_socket.recv(1024).decode("utf-8")
                if not message:
                    break
                output_box.insert(tk.END, f"{client_address}: {message}\n")
                # Nachrichten an alle Clients senden
                for client in clients:
                    if client != client_socket:  # Keine Nachricht an den Absender
                        client.send(f"{client_address}: {message}\n".encode("utf-8"))
            except:
                break
        # Entfernen und Schließen der Verbindung, wenn ein Fehler auftritt oder die Verbindung getrennt wird
        clients.remove(client_socket)
        client_socket.close()

    def accept_connections():
        while True:
            client_socket, client_address = server_socket.accept()
            threading.Thread(target=handle_client, args=(client_socket, client_address), daemon=True).start()

    threading.Thread(target=accept_connections, daemon=True).start()

# Funktion für den Client
def start_client(host, port, output_box):
    client_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    client_socket.connect((host, port))
    output_box.insert(tk.END, f"Verbunden mit Server {host}:{port}\n")

    def listen_to_server():
        while True:
            try:
                message = client_socket.recv(1024).decode("utf-8")
                if not message:
                    break
                output_box.insert(tk.END, f"Server: {message}\n")
            except:
                break

    threading.Thread(target=listen_to_server, daemon=True).start()
    return client_socket

# Funktion zum Senden von Nachrichten
def send_message(socket, message, input_box, output_box):
    if socket and message:
        socket.send(message.encode("utf-8"))
        output_box.insert(tk.END, f"Du: {message}\n")
        input_box.delete(0, tk.END)

# Chat-Overlay mit lila Farbschema
def start_chat_overlay():
    # Initialisierung des Fensters
    window = tk.Tk()
    window.title("Overlay Chat")
    window.geometry("400x600")
    window.configure(bg="#2E0249")  # Lila Hintergrundfarbe

    # Textbereich für Nachrichten
    output_box = ScrolledText(window, wrap=tk.WORD, state=tk.NORMAL, height=20, bg="#4A0473", fg="#E9D5FF", font=("Arial", 12))
    output_box.pack(padx=10, pady=10, fill=tk.BOTH, expand=True)

    # Eingabefeld und Senden-Button
    input_frame = tk.Frame(window, bg="#2E0249")
    input_frame.pack(padx=10, pady=5, fill=tk.X)

    input_box = tk.Entry(input_frame, bg="#4A0473", fg="#E9D5FF", font=("Arial", 12))
    input_box.pack(side=tk.LEFT, fill=tk.X, expand=True, padx=5)

    send_button = tk.Button(input_frame, text="Senden", bg="#7209B7", fg="#FFFFFF", font=("Arial", 12))
    send_button.pack(side=tk.RIGHT, padx=5)

    # Eingabefelder für IP und Port
    ip_label = tk.Label(window, text="Server IP:", bg="#2E0249", fg="#E9D5FF", font=("Arial", 12))
    ip_label.pack(padx=10, pady=5)

    ip_entry = tk.Entry(window, bg="#4A0473", fg="#E9D5FF", font=("Arial", 12))
    ip_entry.pack(padx=10, pady=5)

    port_label = tk.Label(window, text="Server Port:", bg="#2E0249", fg="#E9D5FF", font=("Arial", 12))
    port_label.pack(padx=10, pady=5)

    port_entry = tk.Entry(window, bg="#4A0473", fg="#E9D5FF", font=("Arial", 12))
    port_entry.pack(padx=10, pady=5)

    # Verbindung als Server oder Client
    server_socket = None
    client_socket = None

    def connect_as_server():
        nonlocal server_socket
        host = "0.0.0.0"
        port = 12345  # Beispielport
        start_server(host, port, output_box)

    def connect_as_client():
        nonlocal client_socket
        host = ip_entry.get()  # IP-Adresse aus dem Eingabefeld
        port = int(port_entry.get())  # Port aus dem Eingabefeld
        client_socket = start_client(host, port, output_box)

    # Buttons für Server/Client-Verbindung
    button_frame = tk.Frame(window, bg="#2E0249")
    button_frame.pack(padx=10, pady=5)

    server_button = tk.Button(button_frame, text="Server starten", bg="#7209B7", fg="#FFFFFF", font=("Arial", 12), command=connect_as_server)
    server_button.pack(side=tk.LEFT, padx=5)

    client_button = tk.Button(button_frame, text="Mit Server verbinden", bg="#7209B7", fg="#FFFFFF", font=("Arial", 12), command=connect_as_client)
    client_button.pack(side=tk.RIGHT, padx=5)

    # Nachricht senden
    def send_current_message():
        nonlocal client_socket
        if client_socket:
            send_message(client_socket, input_box.get(), input_box, output_box)

    send_button.config(command=send_current_message)

    # Fenster anzeigen
    window.mainloop()

if __name__ == "__main__":
    start_chat_overlay()
