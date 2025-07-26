import React, { useEffect, useState } from 'react';
import { Button } from '@/components/ui/button';
import { Card, CardContent } from '@/components/ui/card';
import { ethers } from 'ethers';

const PortalView = ({ portalContract, travelContract, walletAddress }) => {
  const [portals, setPortals] = useState<any[]>([]);

  const loadPortals = async () => {
    const total = await portalContract.tokenId();
    const loaded = [];
    for (let i = 0; i < total; i++) {
      const portal = await portalContract.getPortalInfo(i);
      loaded.push({ id: i, ...portal });
    }
    setPortals(loaded);
  };

  const tryTravel = async (id: number) => {
    try {
      const tx = await travelContract.travel(id);
      await tx.wait();
      alert('🚀 Soul traveled to realm!');
    } catch (err) {
      alert('❌ Travel failed. Requirements not met.');
    }
  };

  useEffect(() => {
    loadPortals();
  }, []);

  return (
    <div className="space-y-4 p-4">
      <h2 className="text-xl font-bold">🌀 Available Portals</h2>
      <div className="grid grid-cols-2 gap-4">
        {portals.map(p => (
          <Card key={p.id} className="border-2 border-purple-500 shadow-xl">
            <CardContent className="p-4 space-y-2">
              <div className="text-lg font-semibold">🌌 {p.realmName}</div>
              <div className="text-sm text-gray-300">Access: {p.accessCriteria}</div>
              <Button onClick={() => tryTravel(p.id)} className="bg-purple-700 text-white">
                ✨ Enter Portal
              </Button>
            </CardContent>
          </Card>
        ))}
      </div>
    </div>
  );
};

export default PortalView;
