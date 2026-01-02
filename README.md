# Zip Code Normalizer

A Google Tag Manager variable template for both web and server containers that normalizes postal/zip codes for server-side tracking by removing spaces and hyphens, converting to lowercase. Validates length (3-10 characters).

## Overview

This template prepares postal codes for hashing and sending to advertising platforms like Facebook CAPI, Google Ads, and TikTok. It handles various international postal code formats including alphanumeric codes.

## Installation

1. In your GTM container (web or server-side), go to **Templates** → **Variable Templates** → **Search Gallery**
2. Search for "Zip Code Normalizer"
3. Click **Add to workspace**

## Configuration

| Field | Description |
|-------|-------------|
| **Raw Zip Code** | The postal/zip code in its original form |

## Examples

| Input | Output |
|-------|--------|
| `10000` | `10000` |
| `10 000` | `10000` |
| `90210` | `90210` |
| `90210-1234` | `902101234` |
| `SW1A 1AA` | `sw1a1aa` |
| `K1A 0B1` | `k1a0b1` |
| `10115` | `10115` |
| `12` | `undefined` |
| `12345678901` | `undefined` |

## Features

- Removes spaces and hyphens
- Converts letters to lowercase (for UK, Canada, etc.)
- Keeps only alphanumeric characters (letters and numbers)
- Validates length: must be 3-10 characters after normalization
- Returns `undefined` for invalid or empty input

## Supported Formats

Works with postal codes from any country, including:

| Country | Format | Example |
|---------|--------|---------|
| Croatia | 5 digits | `10000` |
| USA | 5 digits or ZIP+4 | `90210`, `90210-1234` |
| UK | Alphanumeric | `SW1A 1AA` |
| Canada | Alphanumeric | `K1A 0B1` |
| Germany | 5 digits | `10115` |
| Netherlands | 4 digits + 2 letters | `1011 AB` |
| And many more... | |

## Usage Example

1. Create a variable using this template
2. Set **Raw Zip Code** to your postal code data source (e.g., `{{Event Data - zip}}`)
3. Use the normalized output in your tracking tags or hash it for CAPI

## Compatibility

This template works in both:
- **Web GTM** containers
- **Server-side GTM** containers

## Author

**Metryx Studio**  
Website: [metryx.studio](https://metryx.studio)  
Contact: filip@metryx.studio

## License

Apache License 2.0
