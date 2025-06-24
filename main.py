from camoufox.async_api import AsyncCamoufox
import asyncio

async def main():
    async with AsyncCamoufox(headless=True) as browser:
        page = await browser.new_page()
        await page.goto("https://www.browserscan.net/", wait_until="load")
        # Wait for the anchor_progress div to appear
        await page.wait_for_selector("#anchor_progress")

        # Extract all text inside the div, excluding <button> elements
        text = await page.evaluate("""
         () => {
             const container = document.querySelector('#anchor_progress');
             if (!container) return '';

             // Clone the node to safely manipulate it
             const clone = container.cloneNode(true);

             // Remove all <button> elements
             clone.querySelectorAll('button').forEach(btn => btn.remove());

             return clone.innerText.trim();
         }
         """)

        print("Extracted text (higher is better):")
        print(text)

asyncio.run(main())
