import React from 'react';
import { LineChart, Line, XAxis, YAxis, Tooltip, Legend, ResponsiveContainer } from 'recharts';

interface CashFlowTrendChartProps {
  data: { month: string; income: number; expense: number }[];
}

const CashFlowTrendChart: React.FC<CashFlowTrendChartProps> = ({ data }) => {
  if (!data || data.length === 0) {
    return <div className="text-center p-4">No cash flow data available.</div>;
  }

  return (
    <ResponsiveContainer width="100%" height={300}>
      <LineChart
        data={data}
        margin={{
          top: 5,
          right: 30,
          left: 20,
          bottom: 5,
        }}
      >
        <XAxis dataKey="month" />
        <YAxis />
        <Tooltip formatter={(value: any) => `$${(value || 0).toFixed(2)}`} />
        <Legend />
        <Line type="monotone" dataKey="income" stroke="#00C49F" activeDot={{ r: 8 }} />
        <Line type="monotone" dataKey="expense" stroke="#FF0000" activeDot={{ r: 8 }} />
      </LineChart>
    </ResponsiveContainer>
  );
};

export default CashFlowTrendChart;
