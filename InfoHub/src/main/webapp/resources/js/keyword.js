/* styles.css */

function renderCloud(el, data){
const w = el.clientWidth, h = el.clientHeight;
const cols = 6, rows = 4;
const cellW = w / cols, cellH = h / rows;
const cells = Array.from({length: cols*rows}, (_,i)=>i).sort(()=>Math.random()-.5);

const minF = 14, maxF = 38;
const minW = Math.min(...data.map(d=>d.weight));
const maxW = Math.max(...data.map(d=>d.weight));
const scale = (v)=> minF + (maxF-minF) * ((v-minW)/(maxW-minW || 1));

const colors = ["#3b82f6","#ef4444","#10b981","#f59e0b","#6366f1","#0ea5e9","#e11d48"];

data.forEach((d, i)=>{
const tag = document.createElement('span');
tag.className = 'tag';
tag.textContent = d.text;
tag.style.fontWeight = 700;
tag.style.fontSize = scale(d.weight) + 'px';
tag.style.color = colors[i % colors.length];
tag.setAttribute('role','link');
tag.tabIndex = 0;
tag.title = d.text + ' 관련 소식 보기';
tag.addEventListener('click', ()=> alert('키워드: '+d.text));

const cellIdx = cells[i % cells.length];
const cx = cellIdx % cols, cy = Math.floor(cellIdx / cols);
const padX = 12, padY = 10;
const x = cx*cellW + padX + Math.random()*(cellW-2*padX);
const y = cy*cellH + padY + Math.random()*(cellH-2*padY);
tag.style.left = x + 'px';
tag.style.top = y + 'px';

el.appendChild(tag);
});
}

function renderToday(listEl, arr){
arr.forEach(text=>{
const a = document.createElement('a'); a.href="#";
a.innerHTML = `<span class="dot" aria-hidden="true"></span><span>${text}</span>`;
listEl.appendChild(a);
})
}

function renderBoard(listEl, arr){
arr.forEach(item=>{
const a = document.createElement('a'); a.href=item.href; a.textContent = item.title;
listEl.appendChild(a);
})
}

function init(){
renderCloud(document.getElementById('cloud'), keywords);
renderToday(document.getElementById('todayList'), todays);
renderBoard(document.getElementById('boardList'), board);

document.getElementById('goKeywords').addEventListener('click', ()=>{
window.location.href = '#keywords';
});
document.getElementById('goBoard').addEventListener('click', ()=>{
window.location.href = '#board';
});
}

window.addEventListener('load', init);
window.addEventListener('resize', ()=>{
const cloud = document.getElementById('cloud');
cloud.innerHTML = '';
renderCloud(cloud, keywords);
});
