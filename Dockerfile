FROM mcr.microsoft.com/dotnet/runtime:6.0

WORKDIR /app

# Install dependencies
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Download TShock
RUN wget https://github.com/Pryaxis/TShock/releases/download/v5.2.4/TShock-5.2.4-for-Terraria-1.4.4.9-linux-amd64-Release.zip && \
    unzip TShock-*.zip && \
    rm TShock-*.zip && \
    tar -xf TShock-Beta-linux-x64-Release.tar && \
    rm TShock-Beta-linux-x64-Release.tar

# Create worlds directory
RUN mkdir -p worlds

# Expose Terraria port
EXPOSE 7777

# Start server with auto-create
CMD ["dotnet", "./bin/TerrariaServer.dll", "-autocreate", "2", "-world", "worlds/MyWorld.wld", "-worldname", "MyTerraria", "-maxplayers", "8"]
