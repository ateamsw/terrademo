FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["/Terrademo.Backend/Terrademo.Backend.csproj", "Terrademo.Backend/"]
RUN dotnet restore "Terrademo.Backend/Terrademo.Backend.csproj"
COPY . .
WORKDIR "/app/Resources"
COPY ["/Terrademo.Backend/Resources/*", "./"]
WORKDIR "/src/Terrademo.Backend"
RUN dotnet build "Terrademo.Backend.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Terrademo.Backend.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Terrademo.Backend.dll"]