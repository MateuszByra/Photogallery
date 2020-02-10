FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY Photogallery.csproj .
RUN dotnet restore "Photogallery.csproj"
COPY . .
RUN dotnet build "Photogallery.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Photogallery.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
#CMD ["dotnet", "Photogallery.dll"]
CMD ASPNETCORE_URLS=http://*:$PORT dotnet Photogallery.dll