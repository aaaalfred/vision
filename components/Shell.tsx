import Link from "next/link";
import { IconChartPie, IconBuildingStore, IconCamera, IconPhoto, IconChecklist, IconBox, IconUsers, IconSettings, IconSparkles } from "@tabler/icons-react";
const items = [["/", "Resumen", IconChartPie], ["/tiendas", "Tiendas", IconBuildingStore], ["/capturas", "Capturas", IconPhoto], ["/revision/CAP-DEMO-1042", "Revisión visual", IconChecklist], ["#", "Catálogo visual", IconBox], ["#", "Usuarios", IconUsers], ["#", "Configuración", IconSettings]] as const;
export function Shell({ children, active }: { children: React.ReactNode; active: string }) {
 return <div className="app"><aside><div className="brand"><span><IconSparkles size={22}/></span><div>Visión Retail<small>Piloto visual</small></div></div><nav>{items.map(([href,label,Icon])=><Link key={label} href={href} className={active===label?"active":""}><Icon size={20}/>{label}</Link>)}</nav><div className="side-note"><b>ENTORNO DE DEMOSTRACIÓN</b><p>Los datos y resultados visibles son simulados. No representan inferencia de IA.</p></div><div className="profile"><div className="avatar">AT</div><div>Ana Torres<small>Administradora</small></div></div></aside><main><header><div><span className="eyebrow">PILOTO · CLIENTE DEMO</span></div><button className="icon-button">?</button></header>{children}</main></div>
}
export function PageTitle({ title, text, action }: {title:string;text:string;action?:React.ReactNode}) { return <div className="page-title"><div><h1>{title}</h1><p>{text}</p></div>{action}</div> }
export function DemoBadge(){return <span className="demo">DATOS DEMO</span>}
