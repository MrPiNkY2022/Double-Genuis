import React, { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { ethers } from 'ethers';
import { toast } from 'react-hot-toast';
import fireGlyphs from '../fire_language/fire_magic.json';

const DreamMint = ({ dreamContract, walletAddress }) => {
  const [selectedGlyphs, setSelectedGlyphs] = useState<string[]>([]);

  const toggleGlyph = (glyph: string) => {
    setSelectedGlyphs(prev =>
      prev.includes(glyph) ? prev.filter(g => g !== glyph) : [...prev, glyph]
    );
  };

  const mintDream = async () => {
    if (!dreamContract || selectedGlyphs.length === 0) return;
    try {
      const tx = await dreamContract.mintDream(walletAddress, selectedGlyphs);
      await tx.wait();
      toast.success('Dream minted successfully!');
    } catch (err) {
      toast.error('Minting failed');
    }
  };

  return (
    <div className="p-4 space-y-4">
      <h2 className="text-xl font-bold">🜂 Fire Glyph Dream Minting</h2>
      <div className="grid grid-cols-3 gap-2">
        {fireGlyphs.map(glyph => (
          <Card
            key={glyph.symbol}
            className={`cursor-pointer border-2 ${
              selectedGlyphs.includes(glyph.symbol) ? 'border-red-500' : 'border-transparent'
            }`}
            onClick={() => toggleGlyph(glyph.symbol)}
          >
            <CardContent className="p-2">
              <div className="text-2xl">{glyph.symbol}</div>
              <div className="text-xs text-gray-400">{glyph.meaning}</div>
            </CardContent>
          </Card>
        ))}
      </div>
      <Button onClick={mintDream} className="bg-red-600 text-white">
        🔥 Mint Dream
      </Button>
    </div>
  );
};

export default DreamMint;

